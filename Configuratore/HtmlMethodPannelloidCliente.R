

# HTML('<TABLE BORDER=4 CELLSPACING=4 CELLPADDING=4>
#   <TR>
#   <TD BGCOLOR="#ffff00">Yellow Stars
# <TD BGCOLOR="#00ff00">Green Clovers
# </TR>
#   <TR>
#   <TD BGCOLOR="#ff00ff">Purple Moons
# <TD BGCOLOR="00ffff">Blue something or other...
# </TD>
#   </TR>
#   </TABLE>'
    
#obj=cliente
         ####metodouotput pagina html:
#htmlpage1(cliente)
     htlmpage1 =
       function(obj)
         UseMethod("htlmpage1")
     
     htmlpage1.PI=function(obj){
       
       ut_eng0=PI_utenza(PI_Energia(obj))[1]
       ut_eng1 =PI_utenza(PI_Energia(obj))[-1] 
       un_eng0=PI_unita(PI_Energia(obj))[1]
       un_eng1 =PI_unita(PI_Energia(obj))[-1] 
       
       
       return(HTML(c('<style type="text/css">
               .tg  {border-collapse:collapse;border-spacing:0;}
             .tg td{font-family:Arial, sans-serif;font-size:12px;padding:8px 4px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
             .tg th{font-family:Arial, sans-serif;font-size:12px;font-weight:normal;padding:8px 4px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
             .tg .tg-0ord{text-align:right}
             .tg .tg-s6z2{text-align:center}
             </style>
               <table class="tg">
               <tr>
               <th class="tg-031e"></th>
               <th class="tg-031e">Attuale</th>
               <th class="tg-031e">Previsto</th>
          
               </tr>
               <tr>
               <td class="tg-031e">Canone Mese</td>
               <td class="tg-031e">',calcoloCanoneMese(obj),'</td>
               <td class="tg-031e">','?','</td>
              
               </tr>
               <tr>
               <td class="tg-031e">Conto Relax</td>
               <td class="tg-031e">',calcoloContoRelax(obj),'</td>
               <td class="tg-031e">','?','</td>
               </tr>
               <tr>
               </tr>
                         
               <tr>
               <td class="tg-031e">Costo di Attivazione</td>
               <td class="tg-s6z2" colspan = 4>',obj$CostoAttivazione,'</td>
               </tr>
               <tr>
               <td class="tg-031e" colspan=5></td>
               </tr>
               <tr>
               <td class="tg-031e" colspan="5">Servizio - Utenza</td>
               </tr>
               <br>
               </br>
      <tr>
      <th class="tg-031e" colspan="3"></th>
      <th class="tg-031e">Peso Percentuale</th>
      <th class="tg-031e"> Peso Percentuale Nuovo</th>
      </tr>
      <tr>
      <td class="tg-031e" rowspan="2">Voce</td>
      <td class="tg-031e">Minuti Verso Mobili</td>',
                     paste('<td class="tg-031e">',PI_Voce(obj)$minutiVersoMobili,'</td>',sep=""),
                     paste('<td class="tg-031e">',CalcoloPercentuale(obj)$percentualVoce$percentualVoceMobili,"%",'</td>',sep=""),
                     ' <td class="tg-031e"></td>
      </tr>
      <tr>
      <td class="tg-031e">Minuti Verso Fissi</td>',
                     paste('<td class="tg-031e">',PI_Voce(obj)$minutiVersoFissi,'</td>',sep=""),
                     paste('<td class="tg-031e">',CalcoloPercentuale(obj)$percentualVoce$percentualVoceFissi,"%",'</td>',sep=""),
                     '<td class="tg-031e"></td>
      </tr>
      <tr>
     <td class="tg-031e" colspan="5"></td>
     </tr>  
     <tr>
     </tr>

    <tr>
    <th class="tg-031e" > </th>
    <th class="tg-031e">Numero Appoggio </th>
    <th class="tg-031e">Profilo</th>
    <th class="tg-031e">Peso Percentuale Attuale</th>
    <th class="tg-031e">Peso Percentuale Previsto</th>
    </tr>
    <tr>',
                     paste('<td class="tg-031e" rowspan=',length(PI_utenza(PI_ADSL(obj))),'>ADSL</td>'),
                     paste('<td class="tg-031e">',PI_utenza(PI_ADSL(obj))[1],'</td> <td class="tg-031e">','"Manca questo dettaglio"','</td> <td>',CalcoloPercentuale(obj)$percentualADSL[1],"%",'</td>
            <td class="tg-031e"></td>
            </tr>
            ',sep=""),
            
              if(length(PI_utenza(PI_ADSL(obj))[-1]>0)){
                       paste('<tr><td class="tg-031e">',PI_utenza(PI_ADSL(obj))[-1],'</td> <td class="tg-031e">',"Manca questo dettaglio",'</td> <td>',CalcoloPercentuale(obj)$percentualADSL[-1],"%",' 
            <td class="tg-031e"></td>
            </tr>
            ',sep="")
                     },
                     '<tr>
              </tr>
              <tr> <td  colspan=5> </td>
              </tr>
               <tr>
               <td class="tg-031e"></td>
               <td class="tg-031e">POD</td>
               <td class="tg-031e">Consumo Annuo</td>
               <td class="tg-031e"></td>
               <td class="tg-031e"></td>
               </tr>
               <tr>',
                     paste('<td class="tg-s6z2" rowspan="',length(PI_utenza(PI_Energia(obj))),'">Elettricit&agrave</td>',sep=""),
                     paste('<td >',ut_eng0,'</td>'),
                     paste('<td>',un_eng0,'</td>'),
                     paste('<td class="tg-031e">',CalcoloPercentuale(obj)$percentualEnergia[[1]],"%",'</td>',sep=""),
               '<td class="tg-031e"></td>
               </tr>',
                           if( length(PI_utenza(PI_Energia(obj))[-1])>0){
                             paste('<tr> <td >',PI_utenza(PI_Energia(obj))[-1],'</td><td>',PI_unita(PI_Energia(obj))[-1],'</td> <td>',CalcoloPercentuale(obj)$percentualEnergia[-1],"%",'</td><td class="tg-031e"> </td> </tr> ',sep="")
                             
                           },
                           '<td class="tg-031e" colspan="5"></td>
               </tr>
               <tr>
               </tr>
<tr>
      <td class="tg-031e"></td>
      <td class="tg-031e">PDR</td>
      <td class="tg-031e">Consumo Annuo</td>
      <td class="tg-031e"></td>
      <td class="tg-031e"></td>
      </tr>
      <tr>',
                           paste('<td class="tg-s6z2" rowspan="',length(PI_utenza(PI_Gas(obj))),'">GAS</td>',sep=""),
                           paste('<td >',PI_utenza(PI_Gas(obj))[1],'</td>'),
                           paste('<td>',PI_unita(PI_Gas(obj))[1],'</td>'),
                           paste('<td class="tg-031e">',CalcoloPercentuale(obj)$Gas,"%",'</td>',sep=""),
      '<td class="tg-031e"></td>
      </tr>',
                           if(length(PI_utenza(PI_Gas(obj))[-1])>0){
                             paste('<tr> <td >',PI_utenza(PI_Gas(obj))[-1],'</td><td>',PI_unita(PI_Gas(obj))[-1],'</td> <td>',CalcoloPercentuale(obj)$Gas[-1],"%",'</td> <td class="tg-031e"> </td> </tr> <tr> <td> </td> </tr> ',sep="")
                           },
                           '</table>')
                     
                     
       ))
       
     }

     
    
     