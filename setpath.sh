# Creates paths.txt file which can be run in another shell using '. paths.sh' to fetch the variables defined in the paths.sh script.

# bash setpath.txt <picard_path> <bowtie2_reference> <fragScaff_path>

#
# Initials
#

processors=1
mailing=False

#
# Argument parsing
#

while getopts "he:" OPTION; do
	case ${OPTION} in

	    e)
            echo 'picard_path=/external/picard-tools-1.114/'
            echo 'bowtie2_reference=/references/Bowtie2Index/genome'
            echo 'fragScaff_path=/external/fragScaff.pl'
            exit 0
	        ;;

		h)
		    echo ''
			echo 'This script creates paths.txt containing the paths to external software used by the WGH pipeline'
			echo ""
			echo 'Useage: bash set_path.sh <picard_path> <Bowtie2_ref> <fragScaff_path>'
			echo ''
			echo "Positional arguments (required)"
			echo "  <picard_path>       Path to picard tools folder"
			echo "  <Bowtie2_ref>       Path to bowtie2 reference (e.g. /Bowtie2Index/genome)"
			echo "  <fragScaff_path>    Path to fragScaff.pl"
			echo ""
			echo "Optional arguments"
			echo "  -h  help (this output)"
			echo "  -e  example structure of a correct paths.txt file"
			echo ''
			exit 0
			;;
	esac
done

ARG1=${@:$OPTIND:1}
ARG2=${@:$OPTIND+1:1}
ARG3=${@:$OPTIND+2:1}

if [ -z "$ARG1" ] || [ -z "$ARG2" ] || [ -z "$ARG3" ]
        then
        echo ""
        echo "ARGUMENT ERROR"
        echo "Did not find all three positional arguments, see -h for more information."
        echo "(got picard_path:"$ARG1", Bowtie2_ref:"$ARG2" and fragScaff_path:"$ARG3" instead)"
        echo ""
        exit 0
fi

wgh_path=$(dirname "$0")
echo 'WGH_Analysis: Creating paths.txt in your WGH_Analysis folder'

printf '\npicard_path='$1 > $wgh_path/paths.txt
printf '\nbowtie2_reference='$2 >> $wgh_path/paths.txt
printf '\nfragScaff_path='$3 >> $wgh_path/paths.txt