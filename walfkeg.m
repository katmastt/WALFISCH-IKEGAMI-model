function [PL,PLdB] = walfkeg(fc,d,Hbs,Hms,Hr,b,w,angle,town)
% 
%
if((fc >= 800 && fc <= 2000) && (Hbs>= 4 && Hbs <= 50) && (Hms >= 1 && Hms <= 3) && (d >= 0.02 && d <= 5) && (angle >= 0 && angle <= 90))
    if(town == 0)   % Small city
        kf = -4 +0.7*(fc/925 - 1);
    else
        kf = -4 + 1.5*(fc/925 - 1);
    end
    
    DHbs = Hbs - Hr;
    DHr = Hr - Hms;
    Lfs = 42.6 + 26* log(d) + 20*log(fc);
    
    if(angle >= 0 && angle < 35)
        Lori = -10 +0.354*angle;
        
    elseif(angle >= 35 && angle < 55)
        Lori = 2.5 +0.075*(angle-35);
     
    else
        Lori = 4 - 0.114*(angle-55);
        
    end
    if(DHbs > 0)
        kd = 18;
        ka=54;
        Lbsh = (-18) *log(1+DHbs);
    else
        Lbsh = 0;
        kd = 18 - 15*(DHbs/Hr);
        if(d >= 0)
            ka = 54 - 0.8*DHbs;
        else
            ka = 54 - 0.8*DHbs*2*d;
        end
    end
    
    % Difraction Losses from multiple obstacles
    Lmsd = Lbsh + ka+ kd*log(d) + kf*log(fc) - 9*log(b);
    Lrts = -8.2 - 10*log(w) +log(fc) + 20*log(DHr) +Lori;
    
    if(Lrts + Lmsd > 0)
        PLdB = Lfs + Lmsd + Lrts;
    else
        PLdB = Lfs;
    end
    PL = 10^(PLdB/10);
else
   PL=-1; PLdB=-1;

end

end
