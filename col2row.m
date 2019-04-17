%% Col2Row
% 14-Feb-2019
% Usage:  row = col2row(col)
% Output: class 'char', auto-padding added
function row = col2row(col)

switch class(col)

    case 'char'
        % pad with zeros
        for i = 1:size(col,1) % iterate thru rows
            col(i,:) = strrep(col(i,:),' ','0');
        end
        counter = 1;
        row = blanks(numel(col));   % preallocation of memory
        for i = 1:size(col,1)       % iterate thru rows
            for j = 1:size(col,2)    % iterate thru columns
                row(counter) = col(i,j);     % push to row
                counter = counter + 1;
            end
        end



    case 'double'
        matrix = num2str(col);     % convert to char
        for i = 1:size(matrix,1)   % iterate to pad zeros
            matrix(i,:) = strrep(matrix(i,:),' ','0');
        end
        counter = 1;
        row = blanks(numel(matrix));   % preallocation of memory
        for i = 1:size(matrix,1)       % iterate thru rows
            for j = 1:size(matrix,2)    % iterate thru columns
                row(counter) = matrix(i,j);     % push to row
                counter = counter + 1;
            end
        end



    case 'uint8'
        matrix = num2str(double(col));  % convert to double, then string
        for i = 1:size(matrix,1)   % iterate to pad zeros
            matrix(i,:) = strrep(matrix(i,:),' ','0');
        end
        counter = 1;
        row = blanks(numel(matrix));   % preallocation of memory
        for i = 1:size(matrix,1)       % iterate thru rows
            for j = 1:size(matrix,2)    % iterate thru columns
                row(counter) = matrix(i,j);     % push to row
                counter = counter + 1;
            end
        end



    case 'logical'
        matrix = num2str(double(col));  % convert to double, then string
        temp = blanks(size(col,1));
        newcol = repmat(temp,size(col,1),1);
        for i = 1:size(matrix,1)   % iterate to remove whitespace
            newcol(i,:) = strrep(matrix(i,:),' ','');
        end
        counter = 1;
        row = blanks(numel(newcol));   % preallocation of memory
        for i = 1:size(newcol,1)       % iterate thru rows
            for j = 1:size(newcol,2)    % iterate thru columns
                row(counter) = newcol(i,j);     % push to row
                counter = counter + 1;
            end
        end


    otherwise
        row = col;
        fprintf('\nWarning: class "%s" not supported for col2row\n',string(class(col)));

end
% % end of script
