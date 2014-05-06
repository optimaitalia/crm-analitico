######method calcolopercentuale:

#funzioni Base




calcoloCanoneMese=function(obj){
  
  
  if(class(obj)!="PI"){
    
    
    
    
  }else{
    
    
    CostoADSL=PI_costoServizio(PI_ADSL(obj))
    CostoGAS=PI_costoServizio(PI_Gas(obj))
    CostoEnergia=PI_costoServizio(PI_Energia(obj))
    CostoVoce=PI_costoServizio(PI_Voce(obj))
    
  }
  return(sum(CostoADSL,CostoGAS,CostoEnergia,CostoVoce,na.rm=T))
}

#calcoloCanoneMese(obj)


#####ContoRelax(iniziale)

calcoloContoRelax=function(obj){
  
  if(class(obj)!="PI"){
    
    
    
    
  }else{
    
    # CostoADSL=PI_costoServizio(PI_ADSL(obj))
    CostoGAS=PI_costoServizio(PI_Gas(obj))
    CostoEnergia=PI_costoServizio(PI_Energia(obj))
    #CostoVoce=PI_costoServizio(PI_Voce(obj))
    
    
    return(sum(CostoGAS,CostoEnergia))
  }
  
}



###CalcoloPercentuale
###  
CalcoloPercentuale = function(obj){
  
  
  if(class(obj)!="PI"){
    
    
    
    
  }else{
    
    percentualeADSL =array()
    percentualVoce=array()
    percentualEnergia=array()
    percentualGas=array()
    
    if(length(PI_utenza(PI_ADSL(obj)))>0){
      percentualADSL=round(PI_costoServizio(PI_ADSL(obj))/obj$CanoneMese,3) *  100
    }
    
    if(length(PI_utenza(PI_Voce(obj)))>0){
      percentualVoceMobili= round(PI_Voce(obj)$costoServizioVersoMobili/obj$CanoneMese,3) * 100
      percentualVoceFissi= round(PI_Voce(obj)$costoServizioVersoFissi/obj$CanoneMese,3) * 100
    }
    
    
    
    if(length(PI_utenza(PI_Energia(obj)))>0){
      percentualEnergia=round(PI_costoServizio(PI_Energia(obj))/obj$CanoneMese,3) * 100
    }
    
    if(length(PI_utenza(PI_Gas(obj)))>0){
      percentualGas= round(PI_costoServizio(PI_Gas(obj))/obj$CanoneMese,3) * 100
      
    }
    
    Perc=list(percentualVoce=list( percentualVoceMobili=percentualVoceMobili,percentualVoceFissi=percentualVoceFissi),percentualADSL=percentualADSL,percentualEnergia=percentualEnergia,percentualGas=percentualGas)
    return(Perc)
    
  }
}


