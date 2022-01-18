select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and d.d_hash >= 21 and d.d_hash <= 771 and cd.cd_hash >= 29 and cd.cd_hash <= 429 and i.i_hash >= 658 and i.i_hash <= 991
;
