select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,item i,reason r,warehouse w
where ws.ws_order_number = wr.wr_order_number and wr.wr_item_sk = i.i_item_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 172 and ws.ws_hash <= 922 and i.i_hash >= 505 and i.i_hash <= 905
;
