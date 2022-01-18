select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 194 and ss.ss_hash <= 694 and i.i_hash >= 671 and i.i_hash <= 871
;
