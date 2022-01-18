select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 46 and ss.ss_hash <= 796 and cd.cd_hash >= 488 and cd.cd_hash <= 821 and d.d_hash >= 288 and d.d_hash <= 688
;
