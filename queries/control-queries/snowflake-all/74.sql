select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,warehouse w,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 163 and i.i_hash <= 563 and d.d_hash >= 15 and d.d_hash <= 765 and cd.cd_hash >= 318 and cd.cd_hash <= 651
;
