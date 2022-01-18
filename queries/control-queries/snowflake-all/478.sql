select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,date_dim d,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 359 and ws.ws_hash <= 759 and cd.cd_hash >= 297 and cd.cd_hash <= 630 and d.d_hash >= 166 and d.d_hash <= 916
;
