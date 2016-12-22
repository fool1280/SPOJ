const fi='';
      fo='';
var f,g:text;
    t:array[0..5000] of longint;
    n:longint;
procedure Doc;
var i,c:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        t[0]:=0;
        for i:=1 to n do
        begin
                read(f,c);
                t[i]:=t[i-1]+c;
        end;
        close(f);
end;
function Find(x,i,j:longint):boolean;
var l,r,mid:longint;
begin
        l:=i;
        r:=j;
        repeat
                mid:=(l+r) div 2;
                if t[mid]=x then exit(true);
                if t[mid]<x then l:=mid+1 else r:=mid-1;
        until l>r;
        exit(false);
end;
procedure XuLi;
var i,j,len,kq:longint;
begin
        kq:=0;
        for len:=n downto 2 do
        begin
                for i:=1 to n-len+1 do
                begin
                        if (t[i+len-1]+t[i-1]) mod 2=0 then
                        if Find((t[i+len-1]+t[i-1]) div 2,i,i+len-1) then
                        begin
                                assign(g,fo);
                                rewrite(g);
                                write(g,len);
                                close(g);
                                halt;
                        end;
                end;
        end;
end;
begin
        Doc;
        XuLi;
end.