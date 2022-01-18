select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,store_returns sr,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 486 and cd.cd_hash <= 819 and i.i_hash >= 83 and i.i_hash <= 483 and d.d_hash >= 138 and d.d_hash <= 888
;
