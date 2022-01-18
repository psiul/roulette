select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,household_demographics hd,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 156 and d.d_hash <= 489 and i.i_hash >= 247 and i.i_hash <= 997 and cd.cd_hash >= 341 and cd.cd_hash <= 741
;
