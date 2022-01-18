select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and i.i_hash >= 47 and i.i_hash <= 797 and d.d_hash >= 84 and d.d_hash <= 484 and cd.cd_hash >= 625 and cd.cd_hash <= 958
;
