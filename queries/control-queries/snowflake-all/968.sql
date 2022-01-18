select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer_demographics cd,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 147 and ws.ws_hash <= 547 and d.d_hash >= 16 and d.d_hash <= 766 and cd.cd_hash >= 163 and cd.cd_hash <= 496
;
