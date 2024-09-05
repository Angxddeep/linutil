#!/bin/sh -e

. "$(dirname "$0")/../../common-script.sh"

configureDNF() {
    case $PACKAGER in
        dnf)
            echo "max_parallel_downloads=10" | $ESCALATION_TOOL tee -a /etc/dnf/dnf.conf > /dev/null
            echo "fastestmirror=True" | $ESCALATION_TOOL tee -a /etc/dnf/dnf.conf > /dev/null
            echo "defaultyes=True" | $ESCALATION_TOOL tee -a /etc/dnf/dnf.conf > /dev/null
            
            $ESCALATION_TOOL "$PACKAGER" -y install dnf-plugins-core
            ;;
        *)
    esac
}

checkEnv
configureDNF
