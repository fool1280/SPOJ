const fi='';
      fo='';
var f,g:text;
    n,res:longint;
    a,h:array[1..30000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
        close(f);
end;
procedure LIS;
var i,l,r,mid:longint;
begin
        res:=1;
        h[1]:=1;
        for i:=2 to n do
        begin
                if a[i]<a[h[1]] then h[1]:=i
                else
                if a[i]>a[h[res]] then
                begin
                        inc(res);
                        h[res]:=i;
                end
                else
                begin
                        l:=1;
                        r:=res;
                        //tim cuc phai a[h[mid]]
                        {while l<>r do
                        begin
                                mid:=(l+r+1) div 2;
                                if a[i]>a[h[mid]] then l:=mid else r:=mid-1;
                        end;
                        mid:=l;
                        if (a[i]>a[h[mid]]) and (a[i]<a[h[mid+1]]) then h[mid+1]:=i;}
                        //tim cuc trai a[i]
                        repeat
                                mid:=(l+r) div 2;
                                if a[i]>a[h[mid]] then l:=mid+1 else r:=mid;
                        until l=r;
                        h[l]:=i;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,res);
        close(g);
end;
begin
        Doc;
        LIS;
end.
