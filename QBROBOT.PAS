const fi='';
      fo='';
var f,g:text;
    d:array[1..500] of longint;
    mark,kt:array[1..500] of boolean;
    n,m,w,kq,k:longint;
    giua:qword;
    t,c:array[1..500,1..500] of longint;
    kiemtra:boolean;
procedure Doc;
var u,v,i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        fillchar(mark,sizeof(mark),false);
        for i:=1 to n do
        begin
                read(f,u);
                if u=1 then mark[i]:=true else mark[i]:=false;
        end;
        readln(f);
        for u:=1 to n do
        begin
                for v:=1 to n do
                if u=v then
                begin
                        t[u,v]:=0;
                        t[v,u]:=0;
                        c[v,u]:=0;
                        c[u,v]:=0;
                end
                else
                begin
                        t[u,v]:=maxlongint;
                        t[v,u]:=maxlongint;
                        c[u,v]:=maxlongint;
                        c[v,u]:=maxlongint;
                end;
        end;
        readln(f,m);
        k:=0;
        for i:=1 to m do
        begin
                read(f,u,v,t[u,v],c[u,v]);
                t[v,u]:=t[u,v];
                c[v,u]:=c[u,v];
                inc(k,c[u,v]);
        end;
        close(f);
end;
procedure DFS(i,w,s:longint);
var j:longint;
begin
        if mark[i] then w:=giua;
        if (i=n) or (kiemtra) then
        begin
                kiemtra:=true;
                exit;
        end
        else
        begin
                kt[i]:=false;
                for j:=1 to n do
                begin
                if (kt[j]) and (t[i,j]<>maxlongint) then
                begin
                        if (w>=c[i,j]) and (s+t[i,j]+d[j]=d[1]) then
                        begin
                                DFS(j,w-c[i,j],s+t[i,j]);
                        end;
                end;
                end;
        end;
end;
procedure Chat(dau,cuoi:qword);
begin
        kq:=maxlongint;
        while dau<=cuoi do
        begin
                giua:=(dau+cuoi) div 2;
                w:=giua;
                fillchar(kt,sizeof(kt),true);
                kiemtra:=false;
                DFS(1,w,0);
                if (kiemtra=true) then
                begin
                        if giua<kq then kq:=giua;
                        cuoi:=giua-1;
                end
                else dau:=giua+1;
        end;
end;
procedure Dijkstra;
var u,min,v,i:longint;
begin
        for i:=1 to n do
        begin
                d[i]:=maxlongint;
                kt[i]:=true;
        end;
        d[n]:=0;
        repeat
                u:=0;
                min:=maxlongint;
                for i:=1 to n do
                begin
                        if (d[i]<min) and (kt[i]) then
                        begin
                                min:=d[i];
                                u:=i;
                        end;
                end;
                if u=0 then exit;
                kt[u]:=false;
                for v:=1 to n do
                begin
                        if (t[u,v]<>maxlongint) and (d[v]>d[u]+t[u,v]) and (kt[v]) then
                        begin
                                d[v]:=d[u]+t[u,v];
                        end;
                end;
        until false;
end;
begin
        Doc;
        Dijkstra;
        Chat(1,k);
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end.
