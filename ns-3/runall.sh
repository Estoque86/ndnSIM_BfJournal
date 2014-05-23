#!/bin/bash
main=./waf

SCRIPTPATH=`pwd`
sim="NDNSIM"

runs=0
logDir=logs
infoDir=infoSim
#net=`grep 'net=' $iniFile | awk '{print $3}' | awk -F '=' '{print $2}' | awk -F '}' '{print $1}'`

net=geant
T=GEANT
S=Flooding
plateau=0
C=0.003
M=104450
req=11500

for k in 1 1.2      #Alpha
do
        for z in 1    #Lambda
        do
                let "simDuration = $req / $z"
                #simDuration=`expr $req/$z`
echo $simDuration
                let "realReq = $simDuration * $z"
echo $realReq
                #realReq=$simDuration*$z
                echo $realReq > $logDir/req_L\=${z}_A\=${k}
                for i in `seq 0 $runs`
                do
                        j=`expr $i + 1`

                        /usr/bin/time -f "\n%E \t elapsed real time \n%U \t total CPU seconds used (user mode) \n%S \t total CPU seconds used by the system on behalf of the process \n%M \t memory (max resident set size) [kBytes] \n%x \t exit status" -o ${infoDir}/Info_SIM\=T\=${T}_S\=${S}_REQ\=${req}_M\=${M}_C\=${C}_L\=${z}_A\=${k}_R\=${i}.txt $main --run "scratch/bloom-filter-routing-scenario --contentCatalogFib\=${M} --cacheToCatalog\=${C} --lambda\=${z} --valoreAlpha\=${k} --simType\=1 --simStrategy\=${S} --simDuration\=${simDuration} --RngSeed\=1 --RngRun\=${j}" > $logDir/stdout/Log_SIM\=T\=${T}_S\=${S}_REQ\=${req}_M\=${M}_C\=${C}_L\=${z}_A\=${k}_R\=${i}.out 2>&1

                done

                #tar -zcvf $logDir/log_${req}_req_T\=${T}_S\=${S}_M\=${M}_C\=${C}_L\=${z}_A\=${k}.tar.gz $logDir/SIM\=${sim}_T\=${T}_REQ\=${req}_M\=${M}_C\=${C}_L\=${z}_A\=${k}_R*
                #rm $logDir/SIM\=${sim}_T\=${T}_REQ\=${req}_M\=${M}_C\=${C}_L\=${z}_A\=${k}_R*

                tar -zcvf $infoDir/Info_${req}_req_T\=${T}_S\=${S}_M\=${M}_C\=${C}_L\=${z}_A\=${k}.tar.gz $infoDir/Info_SIM\=T\=${T}_S\={S}_REQ\=${req}_M\=${M}_C\=${C}_L\=${z}_A\=${k}_R*
                rm $infoDir/Info_SIM\=T\=${T}_S\={S}_REQ\=${req}_M\=${M}_C\=${C}_L\=${z}_A\=${k}_R*
        done
done


