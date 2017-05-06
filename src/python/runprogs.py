import subprocess
import os
import argparse
from Constants import VARIABLES


def generate_graphs(nodes, ipath, folder, seed):
    '''
    First delete all files from graph folder
    '''
    filenames = next(os.walk(ipath))[2]
    for file in filenames:
        filepath = ipath+file
        os.remove(filepath)

    '''
    crate all the graphs using all combinations of edges and nodes
    '''
    graphCount = 0
    #for i in range(2, nodes):
    #edges = int((i*(i-1))/2)+1 # adding 1 because python skips the last index
    for j in range(1,26):   # setting max edges to 2500, if nodex=200 as higher number gives seg fault
        edges = nodes*j
        filename = folder + 'node_' + str(nodes) + '_edge_' + str(edges) + '.txt'
        f = open(filename, 'w')
        subprocess.call(["./randomgraph", str(nodes), str(edges), str(seed)], stdout=f)
        graphCount+=1

    return graphCount

def remove_bad_graphs(ipath):
    '''
    remove all those graphs in which any node is disconnected
    '''
    deletedCount = 0
    filenames = next(os.walk(ipath))[2]

    for file in filenames:
        lineCount = 0
        filepath = ipath+file
        with open(filepath) as fin:
            for rec in fin:
                if (lineCount == 0):
                    lineCount+=1
                elif(len(rec.strip()) == 0):
                    break
                else:
                    vals = rec.split()
                    if (len(vals) == 1):
                        os.remove(filepath)
                        #print ('Deleted: ' + file)
                        deletedCount+=1
                        break
    return deletedCount

def color_graphs_random(ipath, opath, cfolder, iterations, seed):
    '''
    First delete all files from colored graph folder
    '''
    filenames = next(os.walk(opath))[2]
    for file in filenames:
        filepath = opath+file
        os.remove(filepath)

    '''
    Color the nodes of the graphs using random method
    '''
    coloredGraphCount = 0
    filenames = next(os.walk(ipath))[2]
    for file in filenames:
        print (file)
        ifile = ipath+file      #where graphs are stored
        ofile = cfolder+file    #where colored graphs will be stored
        f = open(ofile, 'w')
        subprocess.call(["./random", ifile, str(iterations), str(seed)], stdout=f)
        coloredGraphCount+=1
    return coloredGraphCount


def color_graphs_greedy(ipath, opath, cfolder):
    '''
    First delete all files from colored graph folder
    '''
    filenames = next(os.walk(opath))[2]
    for file in filenames:
        filepath = opath + file
        os.remove(filepath)

    '''
    Color the nodes of the graphs using greedy method.
    '''
    coloredGraphCount = 0
    filenames = next(os.walk(ipath))[2]
    for file in filenames:
        print (file)
        ifile = ipath+file      #where graphs are stored
        ofile = cfolder+file    #where colored graphs will be stored
        f = open(ofile, 'w')
        subprocess.call(["./greedy", ifile], stdout=f)
        coloredGraphCount+=1
    return coloredGraphCount


def get_coloring_time(opath):
    '''
    get the coloring time for each graph
    '''
    graphColoringTime = []
    filenames = next(os.walk(opath))[2]
    for file in filenames:
        filepath = opath + file
        with open(filepath) as fin:
            for rec in fin:
                if ('Time spent' in rec):
                    graphColoringTime.append(float(rec.split()[2]))
                else:
                    continue

    return graphColoringTime


def get_color_count(opath, coloringMethod):
    '''
    get the max color count that needed to color the graph
    '''
    filenames = next(os.walk(opath))[2]
    maxGraphColor = []
    for file in filenames:
        foundLocation = 0
        filepath = opath + file
        with open(filepath) as fin:
            for rec in fin:
                if (foundLocation == 0):
                    if ('compares maxcolor  colorcount' in rec):
                        foundLocation = 1
                    else:
                        continue
                else:
                    if (coloringMethod == 'random'):
                        maxGraphColor.append(int(rec.split()[4]))
                    elif (coloringMethod == 'greedy'):
                        maxGraphColor.append(int(rec.split()[3]))
                    else:
                        print ('Wrong coloring method')
                    break
    return maxGraphColor



def main():
    '''
    get parameters from command line. To change the folder where graphs will be saved, modify Constants.py
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--coloringMethod',
        choices=['greedy', 'random'],
        help='Enter coloring method - greedy or random')
    parser.add_argument(
        '--numOfNodes',
        type = int,
        help='Enter max number of nodes in the graphs')
    parser.add_argument(
        '--maxIterations',
        type = int,
        help='Enter max number of iterations for random coloring algorithm')

    argument = parser.parse_args()

    # if arguments are not passed, use the default values from Constants.py
    if (argument.coloringMethod):
        coloringMethod = argument.coloringMethod
    else:
        coloringMethod = VARIABLES.coloringMethod

    if (argument.numOfNodes):
        numOfNodes = argument.numOfNodes
    else:
        numOfNodes = VARIABLES.numOfNodes

    if (argument.maxIterations):
        maxIterations = argument.maxIterations
    else:
        maxIterations = VARIABLES.maxIterations


    # generate random graphs
    seed = 10
    #graphCount = generate_graphs(numOfNodes, VARIABLES.ipath, VARIABLES.folder, seed)
    #print ('Generated ' + str(graphCount) + ' graphs')

    # delete those graphs that do not all connected nodes
    #goodGraphCount = graphCount - remove_bad_graphs(VARIABLES.ipath)
    #print ('Remaining ' + str(goodGraphCount) + ' graphs')


    #color the nodes of the graphs and store them in a folder and then get the coloring time
    coloringTimeList = []
    maxGraphColorList = []
    print (coloringMethod)
    if (coloringMethod == 'random'):
        iter = 1
        while (iter <= maxIterations):
            print (iter)
            coloredGraphCount = color_graphs_random(VARIABLES.ipath, VARIABLES.opath, VARIABLES.cfolder, iter, seed)
            # get coloring time
            coloringTime = get_coloring_time(VARIABLES.opath)
            coloringTimeList.append(coloringTime)
            # find the max number of colors needed to color each graph
            maxGraphColor = get_color_count(VARIABLES.opath, coloringMethod)
            maxGraphColorList.append(maxGraphColor)
            iter*=2
        print(str(coloredGraphCount) + ' graphs colored')
        #compute the average time
        #for k, v in coloringTime.items():
        #    coloringTime[k] = sum(v)/len(v)
    elif(coloringMethod == 'greedy'):
        coloredGraphCount = color_graphs_greedy(VARIABLES.ipath, VARIABLES.opath, VARIABLES.cfolder)
        print (str(coloredGraphCount) + ' graphs colored')
        # find coloring time
        coloringTime = get_coloring_time(VARIABLES.opath)
        coloringTimeList.append(coloringTime)
        # find the max number of colors needed to color each graph
        maxGraphColor = get_color_count(VARIABLES.opath, coloringMethod)
        maxGraphColorList.append(maxGraphColor)
    else:
        print ('Wrong coloring method!!!')
    print ('\nColoring Time: ')
    print(coloringTimeList)
    print ('\nMax color: ')
    print (maxGraphColorList)

    '''
    Read the dictionary created above and generate heatmap plots
    '''


if __name__ == '__main__':
    main()

