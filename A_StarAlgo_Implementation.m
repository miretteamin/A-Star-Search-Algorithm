% Rocket League Playground Grid
grid = [0 0 0 0 0 0 0;
        1 0 0 0 0 0 0;
        0 0 1 1 0 0 0;
        0 0 0 0 0 0 0;
        0 0 0 0 0 0 0];


% r for Rows and c for Columns
% Array to hold source and destination (Grabing the ball)
% Array Format: (srcX srcY; destX destY)
SrcDest = [1 1; 3 5];

aStarSearch(grid, SrcDest)


%Functions
function d = euclideanDist(i, j, SrcDest)
    d = (SrcDest(2, 1) - i)*(SrcDest(2, 1) - i) + (SrcDest(2, 2) - j)*(SrcDest(2, 2) - j);
end

function ans = validMove(r, c)
    ans = (r >= 1) && (r <= 5) && (c >= 1) && (c<=7);
end

function ans = foundDest(r, c, SrcDest)
    ans = (r == SrcDest(2,1) && c == SrcDest(2,2));
end

function printPath(cell, SrcDest)
    path = {}
    r = SrcDest(2,1); c = SrcDest(2,2);
    while(~(cell(r, c).parent(1,1) == r && cell(r, c).parent(1, 2) == c))
        path=[path; [r c]];
        tempRow = cell(r, c).parent(1,1);
        tempCol = cell(r, c).parent(1,2);
        r = tempRow;
        c = tempCol;

    end
    path = [path; [r c]];
    display(flip(path));
end

function aStarSearch(grid, SrcDest)
    visited = zeros(5,7); 
    needsVisiting = {};

    % Cells details (Array of struct)
    for r = 1:5
         for c = 1:7
            cell(r, c).f = 1000;
            cell(r, c).g = 1000;
            cell(r, c).h = 1000;
            cell(r, c).parent = [-1 -1];
         end
    end

    % Source Node Node
    r = SrcDest(1,1); c = SrcDest(1,2);
    cell(r, c).f = 0.0;
    cell(r, c).g = 0.0;
    cell(r, c).h = 0.0;
    cell(r, c).parent = [r c];
    
    %Agent can move up, down, left, right
    needsVisiting = [0.0 r c];
    curr = {};

    while(isempty(needsVisiting) == 0)
        % Saving the index of the array with least f and its value
        [val idx] = min(needsVisiting(1:size(needsVisiting),1));
        curr = needsVisiting(idx,:);
        needsVisiting(idx,:) = [];
        % Add to visited 
        r = curr(2); c=curr(3);
        visited(r,c) = 1;
        newG = 0.0; newH = 0.0; newF = 0.0;

        % Move UP
        if validMove(r-1, c) == 1
            if foundDest(r-1, c, SrcDest) == 1
                cell(r-1, c).parent = [r c];
                printPath(cell, SrcDest);
                return;
            elseif visited(r-1, c) == 0 && grid(r-1, c) == 0
                newG = cell(r, c).g + 1.0;
                newH = euclideanDist(r - 1, c, SrcDest);
                newF = newG + newH;
                if cell(r-1, c).f == 1000 || cell(r-1,c).f > newF
                    needsVisiting = [needsVisiting; [newF r-1 c]];
                    cell(r-1, c).f = newF;
                    cell(r-1, c).g = newG;
                    cell(r-1, c).h = newH;
                    cell(r-1, c).parent = [r c];
                end
            end
        end
        
        % Move Down
        if validMove(r+1, c) == 1
             if foundDest(r+1, c, SrcDest) == 1
                cell(r+1, c).parent = [r c];
                printPath(cell, SrcDest);
                return;
            elseif visited(r+1, c) == 0 && grid(r+1, c) == 0
                newG = cell(r, c).g + 1.0;
                newH = euclideanDist(r+1, c, SrcDest);
                newF = newG + newH;
                if cell(r+1, c).f == 1000 || cell(r+1,c).f > newF
                    needsVisiting = [needsVisiting; [newF r+1 c]];
                    cell(r+1, c).f = newF;
                    cell(r+1, c).g = newG;
                    cell(r+1, c).h = newH;
                    cell(r+1, c).parent = [r c];
                end
            end
        end

        % Move Left
        if validMove(r, c-1) == 1
             if foundDest(r, c-1, SrcDest) == 1
                cell(r, c-1).parent = [r c];
                printPath(cell, SrcDest);
                return;
            elseif visited(r, c-1) == 0 && grid(r, c-1) == 0
                newG = cell(r, c).g + 1.0;
                newH = euclideanDist(r, c-1, SrcDest);
                newF = newG + newH;
                if cell(r, c-1).f == 1000 || cell(r, c-1).f > newF
                    needsVisiting = [needsVisiting; [newF r c-1]];
                    cell(r, c-1).f = newF;
                    cell(r, c-1).g = newG;
                    cell(r, c-1).h = newH;
                    cell(r, c-1).parent = [r c];
                end
            end
         end

        % Move Right
        if validMove(r, c+1) == 1
             if foundDest(r, c+1, SrcDest) == 1
                cell(r, c+1).parent = [r c];
                printPath(cell, SrcDest);
                return;
            elseif visited(r, c+1) == 0 && grid(r, c+1) == 0
                newG = cell(r, c).g + 1.0;
                newH = euclideanDist(r, c+1, SrcDest);
                newF = newG + newH;
                if cell(r, c+1).f == 1000 || cell(r, c+1).f > newF
                    needsVisiting = [needsVisiting; [newF r c+1]];
                    cell(r, c+1).f = newF;
                    cell(r, c+1).g = newG;
                    cell(r, c+1).h = newH;
                    cell(r, c+1).parent = [r c];
                end
             end
        end
    end
    return;
end