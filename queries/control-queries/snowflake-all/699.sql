select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer_demographics cd,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 46 and ws.ws_hash <= 446 and d.d_hash >= 24 and d.d_hash <= 774 and cd.cd_hash >= 19 and cd.cd_hash <= 352
;
