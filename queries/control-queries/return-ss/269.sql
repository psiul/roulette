select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 28 and ss.ss_hash <= 428 and i.i_hash >= 613 and i.i_hash <= 946 and d.d_hash >= 40 and d.d_hash <= 790
;
