public class Ordine {
    
    public Integer numeroOrdine;
    public String cliente;
    public Decimal totale;
    
    public Ordine(){}
    
    public void verificaSoglia(){
        
        if (totale>1000){
            
            System.debug('Il totale dell\' ordine supera la soglia massima consentita');
            
        }
        
        else
            
        {
            
            System.debug('Il totale dell\'ordine è sotto la soglia');
            
        }
        
    }
    
    public void stampaInformazioni(){
        
    	System.debug('Ecco le informazioni sull\' ordine:\n' + '\nNumero ordine: ' + numeroOrdine + '\nTotale ordine: ' + totale + ' €' + '\nCliente: ' + cliente);    
        
    }
    
    public List<String> getInformazioniLista(){
        
        List<String> informazioni = new List<String>();
        informazioni.add('Numero ordine: ' + numeroOrdine);
        informazioni.add('Totale ordine: ' + totale + ' €');
        informazioni.add('Cliente: ' + cliente);
        return(informazioni);
        
    }

}