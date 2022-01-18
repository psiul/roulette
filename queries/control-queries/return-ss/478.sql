select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer_demographics cd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 334 and ss.ss_hash <= 667 and cd.cd_hash >= 92 and cd.cd_hash <= 842 and i.i_hash >= 242 and i.i_hash <= 642
;
