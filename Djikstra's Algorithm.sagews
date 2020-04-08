︠0e9a0282-52ec-49ad-a77f-fd6bd37fc59e︠
%md
# Project 13: Dijkstra's Algorithm and the Jarnik-Prim Algorithm

## Jony Karki
︡4d0783f7-2403-4f03-a962-cb72246c4faa︡{"done":true,"md":"# Project 13: Dijkstra's Algorithm and the Jarnik-Prim Algorithm\n\n## Jony Karki"}
︠c51891bc-b75e-4c8a-8b90-eea7a71b4a7b︠
%md
#### Problem No. 1

Prim's algorithm creates a minimum spanning tree of the graph which connects all the vertices in the graph with the least weight whereas, Dijkstra's algorithm creates a shortest path tree starting from a certain vertex to some final vertex.

Prim's algorithm works on undirected graphs only whereas Dijkstra's algorithm works on directed as well as undirected graphs.
︡a34eb01d-ec6c-4129-afdd-f5b46ddd831b︡{"done":true,"md":"#### Problem No. 1\n\nPrim's algorithm creates a minimum spanning tree of the graph which connects all the vertices in the graph with the least weight whereas, Dijkstra's algorithm creates a shortest path tree starting from a certain vertex to some final vertex.\n\nPrim's algorithm works on undirected graphs only whereas Dijkstra's algorithm works on directed as well as undirected graphs."}
︠49016890-5192-4561-9c56-4b994eaf5839i︠
%md(hide=True)
## Problem 2
The result of performing dijkstra's algorithm with starting vertex as 13 is:

Step  | Current Vertex | Distance | Predecessor
-- | -- | -- | --
0 | 13 | 0 | None
1 | 0 | 1 | 13
2 | 1 | 1 | 13
3 | 2 | 1 | 13
4 | 12 | 1 | 13
5 | 18 | 1 | 13
6 | 3 | 2 | 0
7 | 9 | 2 | 0
8 | 6 | 2 | 1
9 | 11 | 2 | 1
10 | 14 | 2 | 2
11 | 15 | 2 | 2
12 | 10 | 2 | 12
13 | 16 | 2 | 12
14 | 19 | 2 | 12
15 | 5 | 3 | 3
16 | 17 | 3 | 9
17 | 4 | 3 | 6
18 | 7 | 3 | 11
19 | 8 | 3 | 10
︡c75ff512-4a45-4532-a2e1-062bd0e19efa︡{"done":true,"md":"## Problem 2\nThe result of performing dijkstra's algorithm with starting vertex as 13 is:\n\nStep  | Current Vertex | Distance | Predecessor\n-- | -- | -- | --\n0 | 13 | 0 | None\n1 | 0 | 1 | 13\n2 | 1 | 1 | 13\n3 | 2 | 1 | 13\n4 | 12 | 1 | 13\n5 | 18 | 1 | 13\n6 | 3 | 2 | 0\n7 | 9 | 2 | 0\n8 | 6 | 2 | 1\n9 | 11 | 2 | 1\n10 | 14 | 2 | 2\n11 | 15 | 2 | 2\n12 | 10 | 2 | 12\n13 | 16 | 2 | 12\n14 | 19 | 2 | 12\n15 | 5 | 3 | 3\n16 | 17 | 3 | 9\n17 | 4 | 3 | 6\n18 | 7 | 3 | 11\n19 | 8 | 3 | 10"}
︠564cd6af-5403-4005-bb0b-f019af46fe5a︠
︡50f6ba47-cfa6-4bba-b556-33670a830c9d︡
︠9b4cbd7d-3cdd-4004-bc92-bbb3a5e1b6f5︠
# Problem 4
G = {0: [2, 3, 9, 13], 1: [6, 9, 11, 13], 2: [0, 6, 9, 12, 13, 14, 15], 3: [0, 5, 15], 4: [17, 6, 7, 8, 11, 14], 5: [3, 10, 14], 6: [16, 1, 2, 4, 10, 12, 14, 15], 7: [17, 4, 11], 8: [4, 10], 9: [0, 1, 17, 2, 18, 11, 12], 10: [5, 6, 8, 11, 12], 11: [16, 1, 4, 7, 9, 10, 14, 15], 12: [16, 2, 19, 6, 9, 10, 13], 13: [0, 1, 2, 18, 12], 14: [2, 18, 19, 4, 5, 6, 11, 15], 15: [2, 3, 6, 11, 14], 16: [17, 19, 6, 11, 12], 17: [16, 4, 7, 9], 18: [9, 13, 14], 19: [16, 12, 14]}

J = {1:[2, 14], 2:[5, 7, 15], 3:[4, 6, 7], 4:[8, 11, 15], 5:[11], 6:[8,9,11], 7:[11], 8:[9,12,14], 9:[10,15], 10:[11,12,13], 11:[13], 12:[14,15], 13:[14,15],14:[15], 15:[], 16:[]}

import queue

def dijkstra(edge_dict, root):
    final_list = []
    visited_vertexes = []
    # Queue will contain lists [vertex, distance, predecessor]
    visit_vertexes = queue.Queue()

    current_vertex = root
    distance = 0
    predecessor = None
    final_list.append((root,distance,predecessor))
    visited_vertexes.append(root)

    for nbr in sorted(edge_dict[root]):
        visit_vertexes.put([nbr,1,root])

    while visit_vertexes.empty() == False:
        new_vertex = visit_vertexes.get()
        vertex = new_vertex[0]
        if vertex not in visited_vertexes:
            visited_vertexes.append(vertex)

            for b in sorted(edge_dict[vertex]):
                visit_vertexes.put([b,new_vertex[1]+1,vertex])

            for key,item in edge_dict.items():
                if vertex in item:
                    visit_vertexes.put([key,new_vertex[1]+1,vertex])

            distance = new_vertex[1]
            predecessor = new_vertex[2]
            final_list.append((vertex,distance,predecessor))

    return final_list

dijkstra(G,13)
︡cb17a7df-3760-44e9-a6e6-fc2d3bd82a7d︡{"stdout":"[(13, 0, None), (0, 1, 13), (1, 1, 13), (2, 1, 13), (12, 1, 13), (18, 1, 13), (3, 2, 0), (9, 2, 0), (6, 2, 1), (11, 2, 1), (14, 2, 2), (15, 2, 2), (10, 2, 12), (16, 2, 12), (19, 2, 12), (5, 3, 3), (17, 3, 9), (4, 3, 6), (7, 3, 11), (8, 3, 10)]\n"}︡{"done":true}
︠61056cbc-2599-4f23-9cd8-e0fa0d97d45f︠









