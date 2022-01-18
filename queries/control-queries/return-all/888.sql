select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and i.i_hash >= 148 and i.i_hash <= 898 and cd.cd_hash >= 594 and cd.cd_hash <= 994 and d.d_hash >= 49 and d.d_hash <= 382
;
