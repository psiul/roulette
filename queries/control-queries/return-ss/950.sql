select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 475 and ss.ss_hash <= 875 and i.i_hash >= 224 and i.i_hash <= 974 and cd.cd_hash >= 319 and cd.cd_hash <= 652
;
