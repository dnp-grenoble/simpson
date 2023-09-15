proc rec {type} {
  global par
  switch $type {
    s3 {
        set rf [expr 0.5*$par(spin_rate)]
        set t90 [expr 0.25e6/$rf]
        set t270 [expr 0.75e6/$rf]
        set t360 [expr 1e6/$rf]
        set par(sw) [expr $par(spin_rate)/16]
        set ph 90
        for {set i 1} {$i <= 2} {incr i} {
  	         pulse $t360 $rf [expr $ph+fmod($i,2)*180]
  	         pulse $t270 $rf [expr $ph+fmod($i,2)*180+180]
  	         pulse $t90  $rf [expr $ph+fmod($i,2)*180]
  	        }
        for {set i 1} {$i <= 2} {incr i} {
  	         pulse $t360 $rf [expr $ph+fmod($i,2)*180+180]
  	         pulse $t270 $rf [expr $ph+fmod($i,2)*180]
  	         pulse $t90  $rf [expr $ph+fmod($i,2)*180+180]
            }
        }
        brs3 {
            set rf [expr 0.5*$par(spin_rate)]
            set t90 [expr 0.25e6/$rf]
            set t270 [expr 0.75e6/$rf]
            set t360 [expr 1e6/$rf]
            set par(sw) [expr $par(spin_rate)/16]
            set ph 90
            pulseid 1 250000 x
            for {set i 1} {$i <= 2} {incr i} {
      	         pulse $t360 $rf [expr $ph+fmod($i,2)*180]
      	         pulse $t270 $rf [expr $ph+fmod($i,2)*180+180]
      	         pulse $t90  $rf [expr $ph+fmod($i,2)*180]
      	        }
            for {set i 1} {$i <= 2} {incr i} {
      	         pulse $t360 $rf [expr $ph+fmod($i,2)*180+180]
      	         pulse $t270 $rf [expr $ph+fmod($i,2)*180]
      	         pulse $t90  $rf [expr $ph+fmod($i,2)*180+180]
                }
                pulseid 1 250000 -x
            }
    sr26 {
      set rf [expr 6.5*$par(spin_rate)]
      set t90 [expr 0.25e6/$rf]
      set t270 [expr 0.75e6/$rf]
      set ph [expr 180*11/26]
      set ph1 [expr $ph+180]
      set ph2 [expr -$ph+180]

      for {set k 1} {$k <=2} {incr k} {
        for {set j 1} {$j <=2} {incr j} {
          for {set i 1} {$i <= 13} {incr i} {
              pulse $t90  $rf [expr pow(-1,$k-1)*pow(-1,$j-1)*$ph+fmod($k+1,2)*180]
      	      pulse $t270 $rf [expr pow(-1,$k-1)*pow(-1,$j-1)*$ph+fmod($k,2)*180]
              pulse $t90  $rf [expr -pow(-1,$k-1)*pow(-1,$j-1)*$ph+fmod($k+1,2)*180]
      	      pulse $t270 $rf [expr -pow(-1,$k-1)*pow(-1,$j-1)*$ph+fmod($k,2)*180]
            }
          }
       }
    }

    postc7 {
      set rf [expr 7*$par(spin_rate)]
      set rf [expr 7.0*$par(spin_rate)]
      set t90 [expr 0.25e6/$rf]
      for {set i 1} {$i <= 7} {incr i} {
          set phase [expr $i*360.0/7.0]
          pulse $t90 $rf $phase
          pulse [expr 4.0*$t90] $rf [expr $phase+180]
          pulse [expr 3.0*$t90] $rf $phase
      }
    }

    rseq {
    set rf [expr ($par(N)/$par(nsub))*$par(spin_rate)]
    set t90 [expr 0.25e6/$rf]
    set phase [expr 180*$par(nusup)/$par(N)]
    set loops [expr $par(N)/2]

    for {set i 1} {$i <= $loops} {incr i} {
        pulse $t90 $rf $phase
        pulse [expr 3.0*$t90] $rf [expr $phase+180]
        pulse $t90 $rf -$phase
        pulse [expr 3.0*$t90] $rf [expr -($phase+180)]
    }
    }

    baba {
      set rf [expr 10*$par(spin_rate)]
      set t90 [expr 0.25e6/$rf]
      set td [expr (0.5e6/$par(spin_rate))-(2*$t90)]

      pulse $t90 $rf x
      delay $td
      pulse $t90 $rf x
      pulse $t90 $rf y
      delay $td
      pulse $t90 $rf -y
      pulse $t90 $rf x
      delay $td
      pulse $t90 $rf x
      pulse $t90 $rf -y
      delay $td
      pulse $t90 $rf y
      pulse $t90 $rf -x
      delay $td
      pulse $t90 $rf -x
      pulse $t90 $rf -y
      delay $td
      pulse $t90 $rf y
      pulse $t90 $rf -x
      delay $td
      pulse $t90 $rf -x
      pulse $t90 $rf y
      delay $td
      pulse $t90 $rf -y
    }
    swfbaba {
      set rf [expr 10*$par(spin_rate)]
      set t90 [expr 0.25e6/$rf]
      set td [expr (0.5e6/$par(spin_rate))-(2*$t90)]

      pulse [expr 0.78*$t90] $rf x
      delay $td
      pulse [expr 0.84*$t90] $rf x
      pulse [expr 0.86*$t90] $rf y
      delay $td
      pulse [expr 0.94*$t90] $rf -y
      pulse [expr 0.98*$t90] $rf x
      delay $td
      pulse [expr 0.99*$t90] $rf x
      pulse [expr 1.00*$t90] $rf -y
      delay $td
      pulse [expr 1.00*$t90] $rf y
      pulse [expr 1.00*$t90] $rf -x
      delay $td
      pulse [expr 1.00*$t90] $rf -x
      pulse [expr 1.01*$t90] $rf -y
      delay $td
      pulse [expr 1.02*$t90] $rf y
      pulse [expr 1.06*$t90] $rf -x
      delay $td
      pulse [expr 1.14*$t90] $rf -x
      pulse [expr 1.16*$t90] $rf y
      delay $td
      pulse [expr 1.22*$t90] $rf -y
    }





    }
}
