# hdinsight-drill

Run an Apache Drill cluster on Azure HDInsight

## Install and use Apache Drill on HDInsight Hadoop clusters

Install Apache Drill on Azure HDInsight using a Script Action.
A script to install Apache Drill (1.10) is available at:

    https://raw.githubusercontent.com/yaron2/hdinsight-drill/master/setup.sh

The script will work on both existing and new HDInsight clusters.
To install Apache Drill on a new cluster, perform the following steps:

1. From the __Cluster summary__ blade, select __Advanced settings__, then __Script actions__. Use the following to populate the form:

   * **NAME**: Enter a friendly name for the script action.
   * **SCRIPT URI**: https://raw.githubusercontent.com/yaron2/hdinsight-drill/master/setup.sh
   * **HEAD**: Don't check this option
   * **WORKER**: Check this option
   * **ZOOKEEPER**: Don't check this option
   * **PARAMETERS**: Leave this field blank

2. At the bottom of the **Script actions** blade, use the **Select** button to save the configuration. Finally, use the **Next** button to return to the __Cluster summary__

3. From the __Cluster summary__ page, select __Create__ to create the cluster.

