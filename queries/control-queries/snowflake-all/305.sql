select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,customer c,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 260 and ws.ws_hash <= 660 and i.i_hash >= 149 and i.i_hash <= 482 and cd.cd_hash >= 131 and cd.cd_hash <= 881
;
