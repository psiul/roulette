select count(ws.ws_item_sk)
from web_sales ws,customer c,web_returns wr,reason r,warehouse w
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 205 and ws.ws_hash <= 605 and c.c_hash >= 153 and c.c_hash <= 903
;
