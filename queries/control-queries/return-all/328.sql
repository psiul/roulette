select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and i.i_hash >= 417 and i.i_hash <= 817 and cd.cd_hash >= 216 and cd.cd_hash <= 549 and hd.hd_hash >= 169 and hd.hd_hash <= 919
;
