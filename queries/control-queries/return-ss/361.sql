select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and d.d_hash >= 152 and d.d_hash <= 902 and hd.hd_hash >= 492 and hd.hd_hash <= 825 and cd.cd_hash >= 203 and cd.cd_hash <= 603
;
