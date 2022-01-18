select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 438 and ss.ss_hash <= 771 and d.d_hash >= 358 and d.d_hash <= 758 and cd.cd_hash >= 205 and cd.cd_hash <= 955
;
