select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 442 and ss.ss_hash <= 775 and cd.cd_hash >= 4 and cd.cd_hash <= 404 and d.d_hash >= 198 and d.d_hash <= 948
;
