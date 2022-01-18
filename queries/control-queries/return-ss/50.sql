select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 25 and ss.ss_hash <= 425 and cd.cd_hash >= 587 and cd.cd_hash <= 920 and d.d_hash >= 9 and d.d_hash <= 759
;
