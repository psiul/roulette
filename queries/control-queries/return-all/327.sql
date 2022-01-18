select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,item i,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 20 and ws.ws_hash <= 420 and c.c_hash >= 647 and c.c_hash <= 980 and cd.cd_hash >= 59 and cd.cd_hash <= 809
;
