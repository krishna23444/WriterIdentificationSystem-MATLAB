    cb=0;
    es=0;
    n=input('1.Create Codebook\n2.Run Enrollment Stage\n3.Run Identification Stage\n');
    switch n
    case 1
        if(cb==0)
            fprintf('Running Codebook');
            tic
            run('codebook');
            toc
            cb=1;
        else
            fprintf('Codebook already generated');
        end        
    case 2
        if(es==0)
            tic
            e1=imread('Enrollment/e1.png');
            e2=imread('Enrollment/e2.png');
            e3=imread('Enrollment/e3.png');
            e4=imread('Enrollment/e4.png');
            e5=imread('Enrollment/e5.png');
            
            fprintf('Running Enrollment Sample Images');
            eSDS1=SDSign('Enrollment/e1.png',cArr);
            eSDS2=SDSign('Enrollment/e2.png',cArr);
            eSDS3=SDSign('Enrollment/e3.png',cArr);
            eSDS4=SDSign('Enrollment/e4.png',cArr);
            eSDS5=SDSign('Enrollment/e5.png',cArr);
            eSOH1=SOH('Enrollment/e1.png');
            eSOH2=SOH('Enrollment/e2.png');
            eSOH3=SOH('Enrollment/e3.png');
            eSOH4=SOH('Enrollment/e4.png');
            eSOH5=SOH('Enrollment/e5.png');
            es=1;
            toc
        else
            fprintf('Templates already generated');
        end
    case 3
        tic
        fprintf('Identification Stage\n');
        m=input('Select one sample.\n1.Sample 1\n2.Sample 2\n3.Sample 3\n4.Sample 4\n5.Sample 5\n');
        fname=strcat(strcat('Identification/i',int2str(m)),'.png');
        figure(1);        
        imshow(fname);
        idsample=imread(fname);
        iSDS1=SDSign(fname,cArr);
        iSOH1=SOH(fname);
%%        fprintf('Finding difference with Enrolled ones');
        D1=0;
        D2=0;
        D3=0;
        D4=0;
        D5=0;
        
        D1a=0;
        D2a=0;
        D3a=0;
        D4a=0;
        D5a=0;
        
        %% Calculating two features Dx=SDS Difference and Dxa=SOH Difference
        
        for i=1:size(iSDS1,2)            
            D1=D1+abs(iSDS1(i)-eSDS1(i));
        end
        DArr1=[];
        DArr2=[];
        DArr3=[];
        DArr4=[];
        DArr5=[];
            
    for i=1:size(iSDS1,2)
        if iSDS1(1,i)>eSDS1(1,i)
            DArr1=[DArr1,(iSDS1(1,i)-eSDS1(1,i))];
        else 
            DArr1=[DArr1,(eSDS1(1,i)-iSDS1(1,i))];
        end
    end
        
        
        for i=1:size(iSOH1,2)
            if(iSOH1(i)~= 0)
                if(eSOH1(i)~= 0)            
                    D1a=D1a+((iSOH1(i)-eSOH1(i))*(iSOH1(i)-eSOH1(i))/(iSOH1(i)+eSOH1(i)));
                end
            end
        end
        
        
        for i=1:size(iSDS1,2)
            D2=D2+abs(iSDS1(i)-eSDS2(i));
        end

     for i=1:size(iSDS1,2)
        if iSDS1(1,i)>eSDS2(1,i)
            DArr2=[DArr2,(iSDS1(1,i)-eSDS2(1,i))];
        else 
            DArr2=[DArr2,(eSDS2(1,i)-iSDS1(1,i))];
        end
    end

        
        for i=1:size(iSOH1,2)
            if(iSOH1(i)~= 0)
                if(eSOH2(i)~= 0)            
                    D2a=D2a+((iSOH1(i)-eSOH2(i))*(iSOH1(i)-eSOH2(i))/(iSOH1(i)+eSOH2(i)));
                end
            end                  
        end
        
        for i=1:size(iSDS1,2)
            D3=D3+abs(iSDS1(i)-eSDS3(i));
        end
       
        for i=1:size(iSDS1,2)
        if iSDS1(1,i)>eSDS3(1,i)
            DArr3=[DArr3,(iSDS1(1,i)-eSDS3(1,i))];
        else 
            DArr3=[DArr3,(eSDS3(1,i)-iSDS1(1,i))];
        end
    end
        
        for i=1:size(iSOH1,2)
            if(iSOH1(i)~= 0)
                if(eSOH3(i)~= 0)            
                    D3a=D3a+((iSOH1(i)-eSOH3(i))*(iSOH1(i)-eSOH3(i))/(iSOH1(i)+eSOH3(i)));
                end
            end
        end
        
        for i=1:size(iSDS1,2)
            D4=D4+abs(iSDS1(i)-eSDS4(i));
        end
       
        for i=1:size(iSDS1,2)
        if iSDS1(1,i)>eSDS4(1,i)
            DArr4=[DArr4,(iSDS1(1,i)-eSDS4(1,i))];
        else 
            DArr4=[DArr4,(eSDS4(1,i)-iSDS1(1,i))];
        end
    end
        
        for i=1:size(iSOH1,2)
            if(iSOH1(i)~= 0)
                if(eSOH4(i)~= 0)            
                    D4a=D4a+((iSOH1(i)-eSOH4(i))*(iSOH1(i)-eSOH4(i))/(iSOH1(i)+eSOH4(i)));
                end
            end
        end
        
        for i=1:size(iSDS1,2)
            D5=D5+abs(iSDS1(i)-eSDS5(i));
        end
        
        for i=1:size(iSDS1,2)
        if iSDS1(1,i)>eSDS5(1,i)
            DArr5=[DArr5,(iSDS1(1,i)-eSDS5(1,i))];
        else 
            DArr5=[DArr5,(eSDS5(1,i)-iSDS1(1,i))];
        end
    end
        
        for i=1:size(iSOH1,2)
            if(iSOH1(i)~= 0)
                if(eSOH5(i)~= 0)            
                    D5a=D5a+((iSOH1(i)-eSOH5(i))*(iSOH1(i)-eSOH5(i))/(iSOH1(i)+eSOH5(i)));
                end
            end
        end
        
        %%Weighted Distance of two Features        
        D1=(0.6*(D1))+(0.4*(D1a));
        D2=(0.6*(D2))+(0.4*(D2a));
        D3=(0.6*(D3))+(0.4*(D3a));
        D4=(0.6*(D4))+(0.4*(D4a));
        D5=(0.6*(D5))+(0.4*(D5a));
        
        figure(2);
        subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e1,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample 1');uicontrol('Style', 'text',...
       'String', strcat('D= ',num2str(D1)),... %replace something with the text you want
       'Units','normalized',...
       'Position', [0.5 0.2 0.1 0.1]); 
   
        figure(3);
        subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e2,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample 2');uicontrol('Style', 'text',...
       'String', strcat('D= ',num2str(D2)),... %replace something with the text you want
       'Units','normalized',...
       'Position', [0.5 0.2 0.1 0.1]); 
   
        figure(4);
        subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e3,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample 3');uicontrol('Style', 'text',...
       'String', strcat('D= ',num2str(D3)),... %replace something with the text you want
       'Units','normalized',...
       'Position', [0.5 0.2 0.1 0.1]); 
        
        figure(5);
        subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e4,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample 4');uicontrol('Style', 'text',...
       'String', strcat('D= ',num2str(D4)),... %replace something with the text you want
       'Units','normalized',...
       'Position', [0.5 0.2 0.1 0.1]); 
        
        figure(6);
        subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e5,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample 5');uicontrol('Style', 'text',...
       'String', strcat('D= ',num2str(D5)),... %replace something with the text you want
       'Units','normalized',...
       'Position', [0.5 0.2 0.1 0.1]); 
        
        diff=D1;
        indx=1;
        if(D2<diff)
            indx=2;
            diff=D2;
            
        end     
        if(D3<diff)
            indx=3;
            diff=D3;
        end
        if(D4<diff)
            indx=4;
            diff=D4;
        end
        if(D5<diff)
            indx=5;
            diff=D5;
        end            
        if(indx==1)
            figure(7);title('Handwriting Found');
            subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e1,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample');
        end
        if(indx==2)
            figure(7);title('Handwriting Found');
            subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e2,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample');
        end
        if(indx==3)
            figure(7);title('Handwriting Found');
            subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e3,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample');
        end
        if(indx==4)
            figure(7);title('Handwriting Found');
            subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e4,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample');
        end
        if(indx==5)
            figure(7);title('Handwriting Found');
            subplot(3,1,2); imshow(idsample,'InitialMagnification',100, 'Border','Loose');title('Identification Sample');subplot(3,1,1); imshow(e5,'InitialMagnification',100, 'Border','Loose');title('Enrolled Sample');
        end                            
        fprintf('Matching Writer %d',indx);
        toc
    end