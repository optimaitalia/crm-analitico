load("BundleDett.Rdata")

###la logica ? creare un estrattore che parta
#dalla pi_clientibundledett e dato un idCliente
## crei un oggetto lista chiamato PI (Prodotto Integrato)
## la lista ha come primo livello un summary globale del prodotto con CanoneMese idCliente 
##definire ora metodoCostruttore.
PI_constructor=function(idCliente,BundleDett){
  #controlli su idCliete
  
  if(idCliente==""){
    
    
    
  }else{
    
    
    
    
    if(nrow(BundleDett[which(BundleDett$cd_cliente==idCliente),])==0){
      
      
      stop("idCliente errato.")
    }else{
      # browser()
      all=BundleDett[which(BundleDett$cd_cliente==idCliente),]
      
      if(any(all[,"cd_servizio"]==1)){
        
        Voce =all[which(all[,"cd_servizio"]==1),] 
        ###manca il cli trovare un modo 'per identificarlo.
        ##manca la data di attivazione
        ##manca la data di disattivazione da prendere sulla tabella del preodotto.
        minutiVersoFissi=ifelse(is.na(sum(Voce[which(Voce[,"cd_servizio"]==1 & Voce[,"cd_ramo"]==1),"cd_unitaincluse"]))
                                ,"flat",sum(Voce[which(Voce[,"cd_servizio"]==1 & Voce[,"cd_ramo"]==1),"cd_unitaincluse"]))
        minutiVersoMobili=ifelse(is.na(sum(Voce[which(Voce[,"cd_servizio"]==1 & Voce[,"cd_ramo"]==2),"cd_unitaincluse"]))
                                 ,"flat",sum(Voce[which(Voce[,"cd_servizio"]==1 & Voce[,"cd_ramo"]==2),"cd_unitaincluse"]))
        
        
        Voce=list(utenza="NULL",
                  dataAttivazione="NULL",
                  dataDisattivazione="NULL",
                  costoServizio = sum(Voce[,"cd_costomese"]),
                  costoServizioVersoFissi = ifelse(is.na(sum(Voce[which(Voce[,"cd_servizio"]==1 & Voce[,"cd_ramo"]==1),"cd_costomese"]))
                                                   ,0,sum(Voce[which(Voce[,"cd_servizio"]==1 & Voce[,"cd_ramo"]==1),"cd_costomese"])),
                  costoServizioVersoMobili = ifelse(is.na(sum(Voce[which(Voce[,"cd_servizio"]==1 & Voce[,"cd_ramo"]==2),"cd_costomese"]))
                                                    ,0,sum(Voce[which(Voce[,"cd_servizio"]==1 & Voce[,"cd_ramo"]==2),"cd_costomese"])),
                  minutiVersoFissi=minutiVersoFissi,
                  minutiVersoMobili=minutiVersoMobili )
        
        class(Voce)="PI_Voce"
        
      }else{Voce  =list()}
      
      if(any(all[,"cd_servizio"]==3)){
        
        
        ###attenzione::::
        ##prevendi un controllo sul fatto che puoi avere piu utenze e devono tutte corrispondere!!!
        
        
        
        ADSL =all[which(all[,"cd_servizio"]==3),]
        ##manca : dataAttivazione 
        #       : dataDisattivazione 
        
        ADSL=list(utenza=ADSL[,"cd_adslcliente"],
                  dataAttivazione="NULL",
                  dataDisattivazione="NULL",
                  costoServizio=ADSL[,"cd_costomese"],
                  unita=ADSL[,"cd_unitaincluse"])  
        class(ADSL)="PI_ADSL"
      } else{ADSL =list()}
      
      
      if(any(all[,"cd_servizio"]==4)){
        ###attenzione::::
        ##prevendi un controllo sul fatto che puoi avere piu utenze e devono tutte corrispondere!!!
        
        Energia =all[which(all[,"cd_servizio"]==4),]
        ##manca : dataAttivazione 
        #       : dataDisattivazione 
        
        Energia=list(utenza=Energia[,"cd_pod"],
                     dataAttivazione="NULL",
                     dataDisattivazione="NULL",
                     costoServizio=Energia[,"cd_costomese"],
                     unita=Energia[,"cd_unitaincluse"]) 
        
        class(Energia) ="PI_Energia"
        
      } else{Energia = list()}
      
      
      if(any(all[,"cd_servizio"]==6)){
        
        Gas =all[which(all[,"cd_servizio"]==6),]
        ##manca : dataAttivazione 
        #       : dataDisattivazione 
        
        Gas=list(utenza=Gas[,"cd_pdr"],
                 dataAttivazione="NULL",
                 dataDisattivazione="NULL",
                 costoServizio=Gas[,"cd_costomese"],
                 unita=Energia[,"cd_unitaincluse"])
        class(Gas) = "PI_Gas"
        
      }else{Gas  = list()}
      
      
      CanoneMese=sum(all[,"cd_costomese"])
      ###NB controlla Bene questa definizione:
      ContoRelax=sum(all[-which(all[,"cd_servizio"]==3),"cd_costomese"])
      #CostoAttivazione=NA,
      #BundleCosti[which(BundleCosti[,"cc_clientibundle"]==unique(all[,"cd_clientibundle"])),]
      CostoAttivazione=NA
      Progressivofatt=NA
      
      PI= list(idCliente=unique(all[,"cd_cliente"]),CanoneMese=CanoneMese,ContoRelax=ContoRelax,CostoAttivazione=NA,Progressivofatt=NA
               ,ADSL=ADSL
               ,Voce=Voce
               ,Energia=Energia
               ,Gas=Gas)
      
      class(PI) = "PI"
      return(PI)
    }
  }
}


###accessor:

PI_idCliente= function(obj) obj$idCliente
PI_ADSL= function(obj)  obj$ADSL 
PI_Voce = function(obj)  obj$Voce 
PI_Energia=function(obj)  obj$Energia 
PI_Gas = function(obj)  obj$Gas 
PI_utenza = function(obj)  obj$utenza
PI_dataAttivazione = function(obj)  obj$dataAttivazione
PI_dataDisattivazione = function(obj)  obj$dataDisattivazione
PI_costoServizio = function(obj) obj$costoServizio
PI_unita= function(obj) obj$unita
#PI_ADSL(cliente)
#PI_unita(cliente$ADSL)

###



#PI_Perserv= function(obj,obj2) round((PI_costoServizio(obj)/(obj2$CanoneMese)),2) * 100

#PI_Perserv(PI_Voce(cliente),cliente)



# PI_costoServizio(PI_ADSL(cliente))
# PI_Perserv(PI_ADSL(cliente))

#cliente=PI_constructor(idCliente="20063",BundleDett=BundleDett)

#PI_Perserv(PI_Energia(cliente),cliente)
#PI_Perserv(PI_Voce(cliente),cliente)
###################################################################################
##MetodoCostruttore Modifica
###################################################################################
# PI_utenza(cliente)
# PI_ModificaServizio=function(obj,serv=c("ADSL")){
#   
#   if(obj != "PI" || length(serv)==0){
#     
#     
#   }else{
#     
#     
#     
#     
#   }
#   
#   
#   
#   
# }


