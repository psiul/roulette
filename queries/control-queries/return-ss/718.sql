select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer_demographics cd,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 148 and ss.ss_hash <= 898 and cd.cd_hash >= 287 and cd.cd_hash <= 687 and hd.hd_hash >= 580 and hd.hd_hash <= 913
;
