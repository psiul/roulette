select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,warehouse w,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and c.c_hash >= 114 and c.c_hash <= 447 and cd.cd_hash >= 214 and cd.cd_hash <= 964 and i.i_hash >= 229 and i.i_hash <= 629
;
