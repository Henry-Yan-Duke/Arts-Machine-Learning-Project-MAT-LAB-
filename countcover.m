function cnt = countcover(sz,blocksize,stepsize)


%  Ron Rubinstein
%  Computer Science Department
%  Technion, Haifa 32000 Israel
%  ronrubin@cs
%
%  August 2008


cnt = ones(sz);
for k = 1:length(sz)
  
  % this code is modified from function NDGRID, so it computes one
  % output argument of NDGRID at a time (to conserve memory)
  ids = (1:sz(k))';
  s = sz; s(k) = [];
  ids = reshape(ids(:,ones(1,prod(s))),[length(ids) s]);
  ids = permute(ids,[2:k 1 k+1:length(sz)]);
  
  cnt = cnt .* max( min(floor((ids-1)/stepsize(k)),floor((sz(k)-blocksize(k))/stepsize(k))) - ...
                    max(ceil((ids-blocksize(k))/stepsize(k)),0) + 1 , 0 );
end

