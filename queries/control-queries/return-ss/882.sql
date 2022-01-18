select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and d.d_hash >= 542 and d.d_hash <= 875 and cd.cd_hash >= 567 and cd.cd_hash <= 967 and i.i_hash >= 169 and i.i_hash <= 919
;
