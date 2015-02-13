import Serial


port=Serial("/dev/ttyAMA0",9600)
port.colse()
port.open()

if True:
    rcv=port.readline()

    if rcv[0:6]=='$GPGGA':
        coma=0
        ind1=[]
        for index in range(len(rcv)):
            if rcv[index]==',':
                coma=coma+1
                ind1.append(index)

        if rcv[ind1[5+1]]!='0':
            latitude=rcv[ind1[1]+1:ind1[2]]
            latNS=rcv[ind1[2]+1:ind1[3]]
            longitude=rcv[ind1[3]+1:ind1[4]]
            lonEW=rcv[ind1[4]+1:ind1[5]]
            status=rcv[ind1[5]+1]
            nsatellites=rcv[ind1[6]+1:ind1[7]]
            altitude=rcv[ind1[8]+1:ind1[9]]
    elif rcv[0:6]=='$GPVTG':
        coma=0
        ind1=[]
        for index in range(len(rcv)):
            if rcv[index]==',':
                coma=coma+1
                ind1.append(index)

        grspeed=rcv[ind1[6]+1:ind1[7]]
