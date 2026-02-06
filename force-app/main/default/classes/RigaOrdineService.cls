public class RigaOrdineService {

    public static void popolaPrezzoUnitario (List<RigaOrdine__c> righe){
    
        Set<Id> productIds = new Set<Id>();
        
        for (RigaOrdine__c r:righe){
        
            if (r.Prodotto__c != null) {
                productIds.add(r.Prodotto__c);
            }
        }

        if (productIds.isEmpty()) return;
        
        Map<Id, Prodotto__c> prodottiMap = new Map<Id, Prodotto__c>(
            [SELECT Id, Prezzo__c FROM Prodotto__c WHERE Id IN :productIds]
        );
        
        for (RigaOrdine__c r : righe) {
            if (r.Prodotto__c != null && prodottiMap.containsKey(r.Prodotto__c)) {
                r.PrezzoUnitario__c = prodottiMap.get(r.Prodotto__c).Prezzo__c;
            }
        }

    }
    
    public static void controllaDisponibilita(List<RigaOrdine__c> righe) {

        Set<Id> productIds = new Set<Id>();

        for (RigaOrdine__c r : righe) {
            if (r.Prodotto__c != null) {
                productIds.add(r.Prodotto__c);
            }
        }

        if (productIds.isEmpty()) return;

        Map<Id, Prodotto__c> prodottiMap = new Map<Id, Prodotto__c>(
            [SELECT Id, Disponibilita__c
             FROM Prodotto__c
             WHERE Id IN :productIds]
        );

        for (RigaOrdine__c r : righe) {
            if (
                prodottiMap.containsKey(r.Prodotto__c) &&
                r.Quantita__c != null
            ) {
                Prodotto__c p = prodottiMap.get(r.Prodotto__c);

                if (p.Disponibilita__c != null &&
                    r.Quantita__c > p.Disponibilita__c) {

                    r.addError(
                        'Quantità superiore alla disponibilità del prodotto.'
                    );
                }
            }
}
}

public static void aggiornaDisponibilita(List<RigaOrdine__c> righe) {

    Map<Id, Decimal> quantitaPerProdotto = new Map<Id, Decimal>();

    for (RigaOrdine__c r : righe) {
        if (r.Prodotto__c != null && r.Quantita__c != null) {

            if (!quantitaPerProdotto.containsKey(r.Prodotto__c)) {
                quantitaPerProdotto.put(r.Prodotto__c, 0);
            }

            quantitaPerProdotto.put(
                r.Prodotto__c,
                quantitaPerProdotto.get(r.Prodotto__c) + r.Quantita__c
            );
        }
    }

    if (quantitaPerProdotto.isEmpty()) return;

    List<Prodotto__c> prodottiDaAggiornare =
        [SELECT Id, Disponibilita__c
         FROM Prodotto__c
         WHERE Id IN :quantitaPerProdotto.keySet()];

    for (Prodotto__c p : prodottiDaAggiornare) {

        Decimal qtaOrdinata = quantitaPerProdotto.get(p.Id);

        if (p.Disponibilita__c == null) {
            p.Disponibilita__c = 0;
        }

        p.Disponibilita__c -= qtaOrdinata;
    }

    update prodottiDaAggiornare;
}

}