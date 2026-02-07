trigger RigaOrdineTrigger on RigaOrdine__c (before insert, before update, after insert) {

    if (Trigger.isBefore) {
    
        RigaOrdineService.popolaPrezzoUnitario(Trigger.new);
        RigaOrdineService.controllaDisponibilita(Trigger.new);
        
    }

    if (Trigger.isAfter && Trigger.isInsert) {
    
        RigaOrdineService.aggiornaDisponibilita(Trigger.new);
        
    }
    
}