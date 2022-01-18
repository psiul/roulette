select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,store_returns sr,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 40 and ss.ss_hash <= 440 and hd.hd_hash >= 230 and hd.hd_hash <= 980 and cd.cd_hash >= 135 and cd.cd_hash <= 468
;
