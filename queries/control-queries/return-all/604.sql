select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,customer_demographics cd,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and d.d_hash >= 453 and d.d_hash <= 786 and cd.cd_hash >= 84 and cd.cd_hash <= 834 and i.i_hash >= 514 and i.i_hash <= 914
;
