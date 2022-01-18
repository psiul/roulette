select count(ws.ws_item_sk)
from web_sales ws,warehouse w,web_returns wr,date_dim d,reason r
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_sold_date_sk = d.d_date_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 458 and ws.ws_hash <= 858 and d.d_hash >= 182 and d.d_hash <= 932
;
