select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,item i,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 147 and d.d_hash <= 897 and i.i_hash >= 562 and i.i_hash <= 962 and cd.cd_hash >= 565 and cd.cd_hash <= 898
;
