const fi='';
      fo='';
var a:array[1..10000,1..10000] of boolean;
    f,g:text;
    n,m,s:longint;
procedure Doc;
var i,j,u,v:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m,s);
        for i:=1 to n do
        begin
                for j:=1 to n do a[i,j]:=false;
        end;
        for i:=1 to m do
        begin
                read(f,u,v);
                a[u,v]:=true;
        end;
        close(f);
end;
procedure BFS;
var front,back,u,v,kq:longint;
    q,d:array[1..10000] of longint;
    kt,mark:array[1..10000] of boolean;
begin
        for u:=1 to n do
        begin
                d[u]:=maxlongint;
                kt[u]:=true;
                mark[u]:=true;
        end;
        kq:=0;
        back:=1;
        front:=1;
        q[1]:=s;
        d[s]:=0;
        kt[s]:=false;
        repeat
                u:=q[front];
                inc(front);
                for v:=1 to n do
                begin
                        if (a[u,v]) then
                        begin
                                if kt[v] then
                                begin
                                        inc(back);
                                        q[back]:=v;
                                        d[v]:=d[u]+1;
                                        if (mark[u]=false) then
                                        begin
                                                inc(kq);
                                                mark[v]:=false;
                                        end;
                                        kt[v]:=false;
                                end
                                else
                                begin
                                        if (d[v]=d[u]+1) and (mark[v]=true) then
                                        begin
                                                inc(kq);
                                                mark[v]:=false;
                                        end;
                                end;
                        end;
                end;
        until front>back;
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        BFS;
end.