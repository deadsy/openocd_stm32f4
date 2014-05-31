
proc show_reg32 {reg adr} {

    if ![catch {set val [memread32 $adr]} msg] {
        echo [format "%-8s: \[0x%08x\] = 0x%08x" $reg $adr $val]
        # Was a helper defined?
        set fn show_${reg}_helper
        if [proc_exists $fn] {
            # Then call it
            $fn $reg $adr $val
        }
    } else {
        error [format "%s (%s)" $msg $reg]
    }
    return
}

proc show_TIM {num} {
    global APB1PERIPH_BASE
    global APB2PERIPH_BASE

    if {$num == 1 || $num == 8} {
        set tim_base [expr $APB2PERIPH_BASE + (($num == 1) ? 0 : 0x400)]
        echo [format "TIM%d at 0x%08x" $num $tim_base]
        show_reg32 "CR1" [expr $base + 0x00]
        show_reg32 "CR2" [expr $base + 0x04]
        show_reg32 "SMCR" [expr $base + 0x08]
        show_reg32 "DIER" [expr $base + 0x0C]
        show_reg32 "SR" [expr $base + 0x10]
        show_reg32 "EGR" [expr $base + 0x14]
        show_reg32 "CCMR1" [expr $base + 0x18]
        show_reg32 "CCMR2" [expr $base + 0x1C]
        show_reg32 "CCER" [expr $base + 0x20]
        show_reg32 "CNT" [expr $base + 0x24]
        show_reg32 "PSC" [expr $base + 0x28]
        show_reg32 "ARR" [expr $base + 0x2C]
        show_reg32 "RCR" [expr $base + 0x30]
        show_reg32 "CCR1" [expr $base + 0x34]
        show_reg32 "CCR2" [expr $base + 0x38]
        show_reg32 "CCR3" [expr $base + 0x3C]
        show_reg32 "CCR4" [expr $base + 0x40]
        show_reg32 "BDTR" [expr $base + 0x44]
        show_reg32 "DCR" [expr $base + 0x48]
        show_reg32 "DMAR" [expr $base + 0x4C]

    } elseif {$num >= 2 && $num <= 5} {
        set base [expr $APB1PERIPH_BASE + (($num - 2) * 0x400)]
        echo [format "TIM%d at 0x%08x" $num $base]
        show_reg32 "CR1" [expr $base + 0x00]
        show_reg32 "CR2" [expr $base + 0x04]
        show_reg32 "SMCR" [expr $base + 0x08]
        show_reg32 "DIER" [expr $base + 0x0C]
        show_reg32 "SR" [expr $base + 0x10]
        show_reg32 "EGR" [expr $base + 0x14]
        show_reg32 "CCMR1" [expr $base + 0x18]
        show_reg32 "CCMR2" [expr $base + 0x1C]
        show_reg32 "CCER" [expr $base + 0x20]
        show_reg32 "CNT" [expr $base + 0x24]
        show_reg32 "PSC" [expr $base + 0x28]
        show_reg32 "ARR" [expr $base + 0x2C]
        show_reg32 "CCR1" [expr $base + 0x34]
        show_reg32 "CCR2" [expr $base + 0x38]
        show_reg32 "CCR3" [expr $base + 0x3C]
        show_reg32 "CCR4" [expr $base + 0x40]
        show_reg32 "DCR" [expr $base + 0x48]
        show_reg32 "DMAR" [expr $base + 0x4C]
        if {$num == 2 || $num == 5} {
            show_reg32 "OR" [expr $base + 0x50]
        }

    } elseif {$num >= 6 && $num <= 7} {
        set tim_base [expr $APB1PERIPH_BASE + 0x1000 + (($num - 6) * 0x400)]
        echo [format "TIM%d at 0x%08x" $num $tim_base]
        show_reg32 "CR1" [expr $base + 0x00]
        show_reg32 "CR2" [expr $base + 0x04]
        show_reg32 "DIER" [expr $base + 0x0C]
        show_reg32 "SR" [expr $base + 0x10]
        show_reg32 "EGR" [expr $base + 0x14]
        show_reg32 "CNT" [expr $base + 0x24]
        show_reg32 "PSC" [expr $base + 0x28]
        show_reg32 "ARR" [expr $base + 0x2C]

    } elseif {$num >= 9 && $num <= 14} {
        if {$num >= 9 && $num <= 11} {
            set tim_base [expr $APB2PERIPH_BASE + 0x4000 + (($num - 9) * 0x400)]
        } elseif {$num >= 12 && $num <= 14} {
            set tim_base [expr $APB1PERIPH_BASE + 0x1800 + (($num - 12) * 0x400)]
        }
        echo [format "TIM%d at 0x%08x" $num $tim_base]


    } else {
        echo "unknown timer number"
    }
    return
}
add_usage_text show_TIM "<num>"
add_help_text show_TIM "show TIM registers"