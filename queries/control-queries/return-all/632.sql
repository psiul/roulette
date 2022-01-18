select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,customer_demographics cd,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 87 and ws.ws_hash <= 837 and i.i_hash >= 181 and i.i_hash <= 514 and cd.cd_hash >= 474 and cd.cd_hash <= 874
;
