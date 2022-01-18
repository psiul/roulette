select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,web_returns wr,reason r
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 5 and ws.ws_hash <= 405 and d.d_hash >= 10 and d.d_hash <= 760
;
